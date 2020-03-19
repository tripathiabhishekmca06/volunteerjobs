package net.guides.springboot.todomanagement;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

@Configuration
public class WebApplicationConfig implements WebMvcConfigurer {/*

@Override
public void addViewControllers(ViewControllerRegistry registry) {
    registry.addViewController("/notFound").setViewName("redirect:/volunteerJobs");
}


@Bean
public WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> containerCustomizer() {
    return container -> {
        container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,
                "/notFound"));
    };
  }

*/
	
	@Bean
    public SimpleUrlHandlerMapping customFaviconHandlerMapping() {
        SimpleUrlHandlerMapping mapping = new SimpleUrlHandlerMapping();
        mapping.setOrder(Integer.MIN_VALUE);
        mapping.setUrlMap(Collections.singletonMap(
          "/favicon.ico", faviconRequestHandler()));
        return mapping;
    }
 
    @Bean
    protected ResourceHttpRequestHandler faviconRequestHandler() {
        ResourceHttpRequestHandler requestHandler
          = new ResourceHttpRequestHandler();
        ClassPathResource classPathResource 
          = new ClassPathResource("images");
        List<Resource> locations = Arrays.asList(classPathResource);
        requestHandler.setLocations(locations);
        return requestHandler;
    }


}
