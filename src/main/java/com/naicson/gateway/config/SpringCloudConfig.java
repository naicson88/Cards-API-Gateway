package com.naicson.gateway.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.CrossOrigin;

@Configuration
public class SpringCloudConfig {
	
	@Value("${yugiohAPI.path}")
	private String yugiohAPIPath;
	
	@Value("${yugiohAdm.path}")
	private String yugiohAdminPath;
	
	@Bean
	public RouteLocator gatewayRoutes(RouteLocatorBuilder routerBuilder) {
		
		return routerBuilder.routes()
				.route(r -> r.path("/yugiohAPI/**")
				.uri(this.yugiohAPIPath))
			   
			   .route(r -> r.path("/v1/admin/**")
			   .uri(this.yugiohAdminPath))
			 .build();
	}
}
