# EG Docketsearch


A django api that the Expungement Generator uses to search the UJS portal for public criminal records dockets.


This app is just a bare-bones django site on top of the `django-docketsearch` django app. (that app is used elsewhere too, which is why it has a life as a distinct app.)

This app gets wrapped up in a docker image, and the Expungement Generator is composed of the image and some others.