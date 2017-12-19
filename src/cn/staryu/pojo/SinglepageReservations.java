package cn.staryu.pojo;

public class SinglepageReservations {
  private Long id;//编号
  private String enrolment;//报名对象
  private String name;//姓名
  private Long age;//年龄
  private String email;//邮箱
  private Long phone;//电话
  private String information;//是否信息已回访

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getEnrolment() {
    return enrolment;
  }

  public void setEnrolment(String enrolment) {
    this.enrolment = enrolment;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Long getAge() {
    return age;
  }

  public void setAge(Long age) {
    this.age = age;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public Long getPhone() {
    return phone;
  }

  public void setPhone(Long phone) {
    this.phone = phone;
  }

  public String getInformation() {
    return information;
  }

  public void setInformation(String information) {
    this.information = information;
  }
}
