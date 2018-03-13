package seed.admin.shiro;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.oltu.oauth2.client.OAuthClient;
import org.apache.oltu.oauth2.client.URLConnectionClient;
import org.apache.oltu.oauth2.client.request.OAuthBearerClientRequest;
import org.apache.oltu.oauth2.client.request.OAuthClientRequest;
import org.apache.oltu.oauth2.client.response.OAuthAccessTokenResponse;
import org.apache.oltu.oauth2.client.response.OAuthJSONAccessTokenResponse;
import org.apache.oltu.oauth2.client.response.OAuthResourceResponse;
import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.message.types.GrantType;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import seed.admin.dto.WeiboUidDto;
import seed.admin.dto.WeiboUserDto;
import seed.core.entity.User;
import seed.core.service.UserService;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-2-18
 * <p>Version: 1.0
 */
public class OAuth2Realm extends AuthorizingRealm {

    private String clientId;
    private String clientSecret;
    private String accessTokenUrl;
    private String userInfoUrl;
    private String redirectUrl;

    @Autowired
    private RestTemplate restTemplate;
    
    @Autowired
    private UserService userService;
    
    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    public void setAccessTokenUrl(String accessTokenUrl) {
        this.accessTokenUrl = accessTokenUrl;
    }

    public void setUserInfoUrl(String userInfoUrl) {
        this.userInfoUrl = userInfoUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof OAuth2Token;//表示此Realm只支持OAuth2Token类型
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        OAuth2Token oAuth2Token = (OAuth2Token) token;
        String code = oAuth2Token.getAuthCode();
        User  user= getUserFromRestApi(code);
        SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);
        return new SimpleAuthenticationInfo("fuckyou111", code, getName());
    }

    private User getUserFromRestApi(String code) {

        try {
            OAuthClient oAuthClient = new OAuthClient(new URLConnectionClient());

            OAuthClientRequest accessTokenRequest = OAuthClientRequest
                    .tokenLocation(accessTokenUrl)
                    .setGrantType(GrantType.AUTHORIZATION_CODE)
                    .setClientId(clientId)
                    .setClientSecret(clientSecret)
                    .setCode(code)
                    .setRedirectURI(redirectUrl)
                    .buildQueryMessage();
          
            OAuthAccessTokenResponse oAuthResponse = oAuthClient.accessToken(accessTokenRequest, OAuth.HttpMethod.POST);

            String accessToken = oAuthResponse.getAccessToken();
            System.out.println("得到的accessToken-->"+accessToken);
            
            WeiboUidDto obj = restTemplate.getForObject("https://api.weibo.com/2/account/get_uid.json?access_token="+accessToken,
            		WeiboUidDto.class);
            System.out.println("根据accessToken获取uid(openid)-->"+obj.getUid());
            
            WeiboUserDto user = restTemplate.getForObject("https://api.weibo.com/2/users/show.json?access_token="+accessToken+"&uid="+obj.getUid(),
            		WeiboUserDto.class);
            System.out.println("获取到的user info-->"+user);
            
            User weiboUser = userService.findByWeiboId(user.getId());
            if(weiboUser == null) {
            	User newUser = new User();
            	newUser.setUsername(user.getName()+"-"+UUID.randomUUID().toString());
            	newUser.setPassword(DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
            	newUser.setWeiboId(user.getId());
            	newUser.setWeiboImg(user.getProfile_image_url());
            	newUser.setWeiboName(user.getName());
            	userService.save(newUser);
            	return newUser;
            }
            else
            	return weiboUser;
        } catch (Exception e) {
            e.printStackTrace();
            throw new OAuth2AuthenticationException(e);
        }
    }
}
