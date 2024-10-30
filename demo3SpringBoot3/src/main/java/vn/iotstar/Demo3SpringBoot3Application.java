package vn.iotstar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import vn.iotstar.configs.SitemeshFillter;

@SpringBootApplication
public class Demo3SpringBoot3Application {

	public static void main(String[] args) {
		SpringApplication.run(Demo3SpringBoot3Application.class, args);
	}
	
	@Bean
	public FilterRegistrationBean<SitemeshFillter> sitemeshFilter () {
		
		FilterRegistrationBean<SitemeshFillter> resgisterBean = new FilterRegistrationBean<SitemeshFillter>();
		resgisterBean.setFilter(new SitemeshFillter());
		resgisterBean.addUrlPatterns("/*");
		
		return resgisterBean;
	}

}
