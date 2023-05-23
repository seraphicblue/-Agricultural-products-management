package stock_m.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.factory.PasswordEncoderFactories;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import jakarta.servlet.http.HttpSession;

@Configuration
public class LoginConfig {

    @Autowired
    private LoginUserDetailService loginUserDetailService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity security,HttpSession session) throws Exception {

        security.authorizeHttpRequests()
            .requestMatchers("/normal/**").authenticated()
            .requestMatchers("/company/**").hasAnyRole("COMPANY", "ADMIN")
            .requestMatchers("/admin/**").hasRole("ADMIN")
            .anyRequest().permitAll()
            .and().formLogin().loginPage("/login/login").defaultSuccessUrl("/")
            .successHandler((request, response, authentication) -> {
                // 로그인 성공 후 권한에 따라 다른 URI로 리다이렉트
            	
            	session.setAttribute("userid", authentication.getName().toString());
                if (authentication.getAuthorities().toString().equals("[ROLE_COMPANY]")) {
                    response.sendRedirect("/company/main");
                } else if (authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
                    response.sendRedirect("/login/loginSuccess");
                } else {
                    response.sendRedirect("/normal/market");
                }
            })
            .and().exceptionHandling().accessDeniedPage("/login/accessDenied")
            .and().logout().invalidateHttpSession(true).logoutSuccessUrl("/login/login")
            .and().sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            .maximumSessions(10) // 동시 세션 제한 수
            .maxSessionsPreventsLogin(false) // 새로운 로그인 허용 여부
            .expiredUrl("/login/login"); // 세션 만료 시 이동할 URL

        security.userDetailsService(loginUserDetailService);
        security.csrf().disable();

        return security.build();
    }

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }

}
