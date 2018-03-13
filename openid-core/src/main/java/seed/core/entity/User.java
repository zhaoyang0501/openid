package seed.core.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import seed.common.entity.BaseEntity;

@Entity
@Table(name = "t_sys_user")
public class User extends BaseEntity<Long> implements Serializable{
	
	private static final long serialVersionUID = 2927194419168198403L;
	
	public static final String DEFAULT_PASSWORD="123456";
	
	private String username;
	
	@JsonIgnore
	private String password;
	
	private String email;
	
	private String salt;
	
	private String remark;
	
	private String tel;
	
	private String chinesename ="";
	
	private String sex;
	
	
	private String weiboId;
	
	private String weiboImg;
	
	private String weiboName;
	
	private String qqId;
	
	private String qqImg;
	
	private String qqName;
	
	
	private Integer score = 0;
	@OneToMany
	private Set<Role> roles;
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getChinesename() {
		return chinesename;
	}
	public void setChinesename(String chinesename) {
		this.chinesename = chinesename;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getWeiboId() {
		return weiboId;
	}
	public void setWeiboId(String weiboId) {
		this.weiboId = weiboId;
	}
	public String getWeiboImg() {
		return weiboImg;
	}
	public void setWeiboImg(String weiboImg) {
		this.weiboImg = weiboImg;
	}
	public String getWeiboName() {
		return weiboName;
	}
	public void setWeiboName(String weiboName) {
		this.weiboName = weiboName;
	}
	public String getQqId() {
		return qqId;
	}
	public void setQqId(String qqId) {
		this.qqId = qqId;
	}
	public String getQqImg() {
		return qqImg;
	}
	public void setQqImg(String qqImg) {
		this.qqImg = qqImg;
	}
	public String getQqName() {
		return qqName;
	}
	public void setQqName(String qqName) {
		this.qqName = qqName;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	
	
}
