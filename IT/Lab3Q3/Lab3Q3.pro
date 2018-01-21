TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.c

pvs_studio.target = pvs
pvs_studio.output = true
pvs_studio.license = /path/to/PVS-Studio.lic
pvs_studio.cxxflags = -std=c++14
pvs_studio.sources = $${SOURCES}
include(PVS-Studio.pri)
