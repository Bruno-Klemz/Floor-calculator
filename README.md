# Floor Calculator

## Table Of Contents
* [Introduction](#introduction)
* [Technologies](#technologies)
* [Launch](#launch)
* [Illustrations](#illustrations)
* [Status](#status)

## Introduction
💻 This project was developed as a job evaluation for PagStar, a company with an emphasis on digital wallets. As requirements for the project were listed:
  - MobX as state management
  - Modular to dependency injection and route system
  - Handle exceptions
  - Great design

## Technologies
- Dart/Flutter
- MobX
- Modular
- Customized Button with Container + Gesture Detector
- Object Oriented Programming
- Route System
- Dependency Injection

## Launch
The minimum requirements to run the project are:
- SDK version: >=2.16.1 <3.0.0
- Ext Kotlin Version = '1.6.10'

## Illustrations

<p align="center">
<img src="https://github.com/Bruno-Klemz/Floor-calculator/blob/develop/apresentation_assets/apresentationPagStartVideo1GIF.gif" 
     width="250" 
     height="527.778" > 
  
   </p>
 <p align="center"> 
  <img src="https://github.com/Bruno-Klemz/Floor-calculator/blob/develop/apresentation_assets/apresentationPagStartVideo2GIF.gif" 
     width="250" 
     height="527.778" />
  </p>
  
- The design was built from the home page of the PagStar app, where the background color is a shade of purple, the main button is blue and the labels uses white.
- Modular was basically used for dependencies injection, considering that the application has only one screen, limiting the possibilities of insertion in the route system.
- For state management with MobX, as it was my first experience, it was interesting to use Observable concepts for variables, as well as Actions for the functions responsible for updating them, in addition to Observer with its own builder that automatically recognizes a change in one of the Observable variables. As a BLoC user, I felt a great ease in building the code, especially in the volume required for the operations developed in the application, when BLoC requires three extra files (BLoC, State and Event).

## Status
- 🏆 Finished 
