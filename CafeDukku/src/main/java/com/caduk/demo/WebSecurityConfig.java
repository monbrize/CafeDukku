package com.caduk.demo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebSecurityConfig {

	/*
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests((authz) -> authz
                .anyRequest().authenticated()
            )
            ;
        http
        	.formLogin()
        	.loginPage("/signIn") //사용자 정의 로그인 페이지
        	.defaultSuccessUrl("/home") //로그인 성공 후 이동 페이지
        	.failureUrl("/sighIn") //로그인 실패 후 이동 페이지
			.usernameParameter("email") 
			.passwordParameter("pwd")
			//.loginProcessingUrl("login_proc") 
			.successHandler(new AuthenticationSuccessHandler() {
				  
				  @Override public void onAuthenticationSuccess(HttpServletRequest request,
				  HttpServletResponse response, Authentication authentication) throws
				  IOException, ServletException { // TODO Auto-generated method stub
				  System.out.println("로그인 성공 authentication : "+authentication.getName());
				  
				  response.sendRedirect("/home"); }
				  
				  }) 
			
				
				  .failureHandler(new AuthenticationFailureHandler() {
				  
				  @Override public void onAuthenticationFailure(HttpServletRequest request,
				  HttpServletResponse response, AuthenticationException exception) throws
				  IOException, ServletException { // TODO Auto-generated method stub
				   System.out.println("로그인 실패 예외 exception : " + exception.getMessage());
				   response.sendRedirect("/"); 
				  }
				  
				  })
				 
				 
				 
        	.permitAll() //loginPage에 접근 하는 사람은 로그인 페이지가 보여야 하기 때문에 권한 permitAll을 통해 접근 가능하게 함.
        	;
        return http.build();
    }
    */
		
}
