#############################################################################
# Makefile for building: libra-qt.app/Contents/MacOS/libra-qt
# Generated by qmake (2.01a) (Qt 4.8.4) on: Mon Mar 11 17:20:14 2013
# Project:  libra-qt.pro
# Template: app
# Command: /usr/bin/qmake -spec /usr/local/Qt4.8/mkspecs/macx-xcode -o libra-qt.xcodeproj/project.pbxproj libra-qt.pro
#############################################################################

MOC       = /Developer/Tools/Qt/moc
UIC       = /Developer/Tools/Qt/uic
LEX       = flex
LEXFLAGS  = 
YACC      = yacc
YACCFLAGS = -d
DEFINES       = -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
INCPATH       = -I/usr/local/Qt4.8/mkspecs/macx-xcode -I. -I/Library/Frameworks/QtCore.framework/Versions/4/Headers -I/usr/include/QtCore -I/Library/Frameworks/QtGui.framework/Versions/4/Headers -I/usr/include/QtGui -I/usr/include -I. -I. -I/usr/local/include -I/System/Library/Frameworks/CarbonCore.framework/Headers -F/Library/Frameworks
DEL_FILE  = rm -f
MOVE      = mv -f

IMAGES = 
PARSERS =
preprocess: $(PARSERS) compilers
clean preprocess_clean: parser_clean compiler_clean

parser_clean:
check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compilers: ../src/moc_MemWnd.cpp ../src/moc_VMWorker.cpp ../src/moc_QMemModel.cpp\
	 ../src/moc_QKbdFilter.cpp ../src/qrc_Resources.cpp ../src/ui_MemWnd.h
compiler_objective_c_make_all:
compiler_objective_c_clean:
compiler_moc_header_make_all: ../src/moc_MemWnd.cpp ../src/moc_VMWorker.cpp ../src/moc_QMemModel.cpp ../src/moc_QKbdFilter.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) ../src/moc_MemWnd.cpp ../src/moc_VMWorker.cpp ../src/moc_QMemModel.cpp ../src/moc_QKbdFilter.cpp
../src/moc_MemWnd.cpp: ../src/VM.hpp \
		../src/Memory.hpp \
		../src/Processor.hpp \
		../src/Instruction.hpp \
		../src/Prefix.hpp \
		../src/Operand.hpp \
		../src/Register.hpp \
		../src/IPeripheral.hpp \
		../src/Breakpoint.hpp \
		../src/VMWorker.hpp \
		../src/MemWnd.hpp
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/MemWnd.hpp -o ../src/moc_MemWnd.cpp

../src/moc_VMWorker.cpp: ../src/VM.hpp \
		../src/Memory.hpp \
		../src/Processor.hpp \
		../src/Instruction.hpp \
		../src/Prefix.hpp \
		../src/Operand.hpp \
		../src/Register.hpp \
		../src/IPeripheral.hpp \
		../src/Breakpoint.hpp \
		../src/VMWorker.hpp
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/VMWorker.hpp -o ../src/moc_VMWorker.cpp

../src/moc_QMemModel.cpp: ../src/QMemModel.hpp
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/QMemModel.hpp -o ../src/moc_QMemModel.cpp

../src/moc_QKbdFilter.cpp: ../src/QKbdFilter.hpp
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/QKbdFilter.hpp -o ../src/moc_QKbdFilter.cpp

compiler_rcc_make_all: ../src/qrc_Resources.cpp
compiler_rcc_clean:
	-$(DEL_FILE) ../src/qrc_Resources.cpp
../src/qrc_Resources.cpp: ../src/Resources.qrc
	/Developer/Tools/Qt/rcc -name Resources ../src/Resources.qrc -o ../src/qrc_Resources.cpp

compiler_image_collection_make_all: ../src/qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) ../src/qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_rez_source_make_all:
compiler_rez_source_clean:
compiler_uic_make_all: ../src/ui_MemWnd.h
compiler_uic_clean:
	-$(DEL_FILE) ../src/ui_MemWnd.h
../src/ui_MemWnd.h: ../src/MemWnd.ui
	/Developer/Tools/Qt/uic ../src/MemWnd.ui -o ../src/ui_MemWnd.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean compiler_uic_clean 

