#-------------------------------------------------
#
# Project created by QtCreator 2014-01-04T16:27:31
#
#-------------------------------------------------

QT += core widgets xml qml concurrent network

TARGET = SpriteSheetPacker
TEMPLATE = app

CONFIG += c++11
#QMAKE_CXXFLAGS +=-std=c++11 -stdlib=libc++

INCLUDEPATH += 3rdparty

SOURCES += main.cpp\
    MainWindow.cpp \
    SpriteAtlas.cpp \
    ScalingVariantWidget.cpp \
    SpritePackerProjectFile.cpp \
    PngOptimizer.cpp \
    PublishSpriteSheet.cpp \
    PreferencesDialog.cpp \
    PublishStatusDialog.cpp \
    AboutDialog.cpp \
    SpritesTreeWidget.cpp \
    command-line.cpp \
    PolygonImage.cpp \
    SpriteAtlasPreview.cpp \
    StatusBarWidget.cpp \
    AnimationPreviewDialog.cpp \
    UpdaterDialog.cpp

HEADERS += MainWindow.h \
    ImageRotate.h \
    SpriteAtlas.h \
    ScalingVariantWidget.h \
    SpritePackerProjectFile.h \
    PngOptimizer.h \
    PublishSpriteSheet.h \
    PreferencesDialog.h \
    PublishStatusDialog.h \
    AboutDialog.h \
    SpritesTreeWidget.h \
    PolygonImage.h \
    SpriteAtlasPreview.h \
    ImageFormat.h \
    StatusBarWidget.h \
    AnimationPreviewDialog.h \
    UpdaterDialog.h

#algorithm
INCLUDEPATH += algorithm

HEADERS += algorithm/binpack2d.hpp \
    algorithm/triangle_triangle_intersection.h \
    algorithm/polypack2d.h

SOURCES += algorithm/polypack2d.cpp


#other...

FORMS += MainWindow.ui \
    ScalingVariantWidget.ui \
    PreferencesDialog.ui \
    PublishStatusDialog.ui \
    AboutDialog.ui \
    SpriteAtlasPreview.ui \
    StatusBarWidgetatusbarwidget.ui \
    AnimationPreviewDialog.ui \
    UpdaterDialog.ui

RESOURCES += resources.qrc

include(TPSParser/TPSParser.pri)
include(3rdparty/optipng/optipng.pri)
include(3rdparty/qtplist-master/qtplist-master.pri)
include(3rdparty/clipper/clipper.pri)
include(3rdparty/poly2tri/poly2tri.pri)
include(3rdparty/pngquant/pngquant.pri)
include(3rdparty/lodepng/lodepng.pri)
include(3rdparty/PVRTexTool/PVRTexTool.pri)

OTHER_FILES += \
    defaultFormats/cocos2d.js \
    defaultFormats/cocos2d-old.js \
    defaultFormats/pixijs.js \
    defaultFormats/json.js

macx {
    ICON = SpritePacker.icns
    exportFormats.files = $$files(defaultFormats/*.*)
    exportFormats.path = Contents/MacOS/defaultFormats
    QMAKE_BUNDLE_DATA += exportFormats
}

win32 {
    RC_ICONS = SpritePacker.ico
    exportFormats.files = $$files(defaultFormats/*.*)
    exportFormats.path = defaultFormats
    DEPLOYMENT += exportFormats
}

CONFIG(release,debug|release) {
    # release
    win32 {
        DESTDIR = $$PWD/../install/win/bin
        DEPLOY_COMMAND = windeployqt
        isEmpty(TARGET_EXT) TARGET_EXT = .exe
    }

    macx {
        DESTDIR = $$PWD/../install/macos/bin
        DEPLOY_COMMAND = macdeployqt
        isEmpty(TARGET_EXT) TARGET_EXT = .app
    }

    DEPLOY_TARGET = $$shell_quote($$shell_path($${DESTDIR}/$${TARGET}$${TARGET_EXT}))

    QMAKE_POST_LINK = $${DEPLOY_COMMAND} $${DEPLOY_TARGET}
}
