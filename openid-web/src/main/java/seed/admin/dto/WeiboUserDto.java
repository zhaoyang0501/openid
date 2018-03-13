package seed.admin.dto;

public class WeiboUserDto {
	private String id;
	private String name;
	private String location;
	private String profile_image_url;
	
	
	@Override
	public String toString() {
		return "WeiboUserDto [id=" + id + ", name=" + name + ", location=" + location + ", profile_image_url="
				+ profile_image_url + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getProfile_image_url() {
		return profile_image_url;
	}
	public void setProfile_image_url(String profile_image_url) {
		this.profile_image_url = profile_image_url;
	}
	
	
	
}
