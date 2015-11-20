package com.artgallery.controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InitialController {
  static final Logger logger = Logger.getLogger(InitialController.class);

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String appload(ModelMap model) {
    logger.debug(" appload method is called");
    model.addAttribute("welcomeMessage", "Welcome To Art Gallery Application");
    return "index";
  }
}
