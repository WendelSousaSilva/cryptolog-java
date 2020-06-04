package br.com.pentagono.estoque.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.pentagono.estoque.filters.JwtRequestFilter;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService usuarios;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(usuarios).passwordEncoder(passwordEncoder());
	}
	
	@Order(1)
	@Configuration
	public static class ApiConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired
		private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
		
		@Autowired
		private JwtRequestFilter jwtRequestFilter;
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http.antMatcher("/api/**").authorizeRequests()
				.antMatchers("/api/fornecedores/**").permitAll()
				.antMatchers("/api/usuarios/login").permitAll()
				.anyRequest().authenticated()
				.and().exceptionHandling().authenticationEntryPoint(jwtAuthenticationEntryPoint)
				.and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and().csrf().disable();
			
			http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
		}
	}

	@Order(2)
	@Configuration
	public static class WebConfig extends WebSecurityConfigurerAdapter {
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {

			http.authorizeRequests().
				antMatchers("/").permitAll().
				antMatchers("/home").permitAll().
				antMatchers("/static/**").permitAll().
				antMatchers("/perfis").hasRole("ADMIN").
				antMatchers("/usuarios/**").hasRole("ADMIN").
				anyRequest().authenticated().
				and().
				formLogin().defaultSuccessUrl("/").loginPage("/login").permitAll().
				and().
				logout().logoutSuccessUrl("/").logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
		}		
	}
}
