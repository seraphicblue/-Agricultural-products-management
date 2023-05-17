package stock_m.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.crypto.factory.PasswordEncoderFactories;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class LoginConfig {

    @Autowired
    private LoginUserDetailService loginUserDetailService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity security) throws Exception {

        security.authorizeHttpRequests()
            .requestMatchers("/normal/**").authenticated()
            .requestMatchers("/company/**").hasAnyRole("COMPANY", "ADMIN")
            .requestMatchers("/admin/**").hasRole("ADMIN")
            .anyRequest().permitAll()
            .and().formLogin().loginPage("/login/login").defaultSuccessUrl("/")
            .successHandler((request, response, authentication) -> {
                // 로그인 성공 후 권한에 따라 다른 URI로 리다이렉트
                if (authentication.getAuthorities().toString().equals("[COMPANY]")) {
                    response.sendRedirect("/test");
                } else if (authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
                    response.sendRedirect("/login/loginSuccess");
                } else {
                    response.sendRedirect("/market");
                }
            })
            .and().exceptionHandling().accessDeniedPage("/login/accessDenied")
            .and().logout().invalidateHttpSession(true).logoutSuccessUrl("/login/login");

        security.userDetailsService(loginUserDetailService);
        security.csrf().disable();

        return security.build();
    }

    /*
     * @Bean public PasswordEncoder passwordEncoder() { return
     * PasswordEncoderFactories.createDelegatingPasswordEncoder(); }
     */

}
