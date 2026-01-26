=========================================
Overview of the tutorials: learn Qubes OS
=========================================

The following tutorials present Qubes OS by practicing basic skills. The tutorials should be followed in order. You will do simple things like connecting to a Wi-Fi access point. By doing that, you will be told about how Qubes OS works.

.. hint::

   **If you already know the system** and just want to check how to accomplish something, see the :ref:`how-to-guides` instead.

Each tutorial will cover a generic situation where you will be asked to accomplish simple tasks. Before starting, you are supposed to install Qubes OS with the default options. It is better if you do follow the tutorials, before putting real data on your Qubes OS installation.

In the tutorials, we will see the following:

.. toctree::

   connect-to-wifi

* how to update your system
* start using a USB stick
* learn how to browse internet, store credentials and use Tor
* learn how to handle untrusted files
* how to install a software
* learn how to change wallpaper
* how to create a backup, revert a mistake
* how to restrict some actions

That could seem very common tasks, but they all have security implications. Keeping things simple will help us understand how Qubes OS works and why it is different.

While following the tutorials, some links will be present:

1. internal links to the Qubes OS documentation.
2. external links to the documentation of other projects

Each time you encounter a link for the first time, ignore it. The tutorials are self-contained and you should not need extra requirements. The things that you should learn will be repeated and you will learn them by practicing, no need to learn any definition. The links are a tool for the learner to check again something or, get detailed information about a topic, especially if it is not directly related to Qubes OS.

The requirements should be limited to knowing how to interact with a computer: using a mouse or the keyboard, connecting to internet, plugging an external USB stick or hard drive,...

Terms or actions that will be presented
---------------------------------------

compartmentalization/isolation/qube
  :doc:`connect-to-wifi`, USB stick

virtual machine/domain (Xen)

template
   update system, install software

app qube
    browse internet

disposable/named disposable
   USB stick, browse internet, untrusted files

disposable template
   USB stick, browse internet, untrusted files

admin qube
   :doc:`connect-to-wifi`

GUI domain
   :doc:`connect-to-wifi`

service qube
   :doc:`connect-to-wifi`

internal qube
   browse internet

preloaded qube
   browse internet

net qube
   :doc:`connect-to-wifi`

standalone/HVM/PV
   ?

policy
   restrict some actions

dom0
   :doc:`connect-to-wifi`, USB stick

domU
   ?

Xen
   ?

inheritance/persistance
   update system

levels of trust
   browse internet

block device/USB device
   USB stick

App menu/Settings: applications
   ?

Domain widget
   :doc:`connect-to-wifi`

Device widget
   USB stick

Global clipboard
   browse internet

Settings: firewall
   browse internet

Settings: services
   :doc:`connect-to-wifi`

Settings: devices
   :doc:`connect-to-wifi`, USB stick

Clock qube
   ?

Fullscreen mode
   wallpaper

Update proxy
   system updates

HAL
   ?

rc.local
   ?

a qube's property/feature/tag
   ?
