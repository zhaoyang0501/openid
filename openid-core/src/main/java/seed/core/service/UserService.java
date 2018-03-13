package seed.core.service;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seed.common.exception.AlreadyExistedException;
import seed.common.service.SimpleCurdService;
import seed.core.entity.Role;
import seed.core.entity.User;
import seed.core.repository.RoleRepository;
import seed.core.repository.UserRepository;

@Service
public class UserService extends SimpleCurdService<User, Long> {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Transactional
	public User registerUser(String username,String password,String chinesename) throws AlreadyExistedException{
		User user = userRepository.findByUsername(username);
		if(user!=null)
			throw new AlreadyExistedException("用户名已经存在");
		else
		user = new User();
		user.setChinesename(chinesename);
		user.setUsername(username);
		user.setPassword(DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
		return userRepository.save(user);
	}
	/***
	 * 登录不成功返回null
	 * @return
	 */
	public User login(String username,String password){
		return  this.userRepository.findByUsernameAndPassword(username, DigestUtils.md5Hex(password));
	}
	
	public User findByUsername(String username){
		return this.userRepository.findByUsername(username);
	}
	
	public List<Role> findAllRoles(){
		return (List<Role>)this.roleRepository.findAll();
	}
	
	public Role findRole(Long id){
		return this.roleRepository.findOne(id);
	}
	
	public List<User> findAll(){
		return (List<User>)this.userRepository.findAll();
	}
	
	public List<User> findUserByRole(Long roleid){
		return this.userRepository.findUserByRole(roleid);
	}
	
	
	
	public User findByWeiboId(String weiboid){
		return this.userRepository.findByWeiboId(weiboid);
	}
	
}
