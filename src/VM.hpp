/*-------------------------------------*\
|
|  File Name: VM.hpp
|
|  Creation Date: 25-09-2012
|
|  Last Modified: Thu, Sep 27, 2012  2:06:12 PM
|
|  Created By: Robert Nelson
|
\*-------------------------------------*/

#pragma once

#include <vector>

#include "Processor.hpp"
#include "IPeripheral.hpp"

class Instruction;

class VM {

	public:
        VM();
		
		int Run();
        int Step();

        int LoadObjectFile(const char* filename);
        int LoadVirgoFile(const char* filename);

        inline bool isLoaded() { return mLoaded; }
        void Disassemble();
        std::string GetInstructionStr(unsigned int index);
        const unsigned int GetNumInstructions() { return mInstructions.size(); }
        const std::vector<IPeripheral*> & GetDevices() { return mProc.GetDevices(); }
        const Processor & GetProc() { return mProc; }

		const static int MEM_SIZE = 0x10000;

		const static int VM_SUCCESS	= 0x00;
		const static int VM_ERR_FOPEN	= 0x01;
		const static int VM_ERR_FREAD	= 0x02;

	private:

        bool mLoaded;
        bool mRunning;

		Processor	mProc;
		unsigned char	mMem[MEM_SIZE];
        std::vector<Instruction*> mInstructions;
		
};
