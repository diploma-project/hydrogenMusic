TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += qt

CONFIG += v-play
QT       += core gui sql

SOURCES += main.cpp \
    sever.cpp \
    control.cpp
LIBS += -lpthread -lboost_system -lboost_thread

HEADERS += \
    server.h \
    file_info.h \
    receiver.h \
    control.h
QMAKE_LFLAGS += -Wl,-rpath,/opt/Qt/5.4/gcc_64/plugins/sqldrivers

