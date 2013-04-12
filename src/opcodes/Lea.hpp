/*-------------------------------------*\
|
|  File Name: Lea.hpp
|
|  Creation Date: 19-10-2012
|
|  Last Modified: Fri, Oct 19, 2012  2:41:34 PM
|
|  Created By: Robert Nelson
|
\*-------------------------------------*/

#pragma once

#include "../Instruction8086.hpp"

class Lea : public Instruction8086 {
	public:
		static Instruction* CreateInstruction(Memory::MemoryOffset& memLoc, Processor* proc);
		int Execute();

		enum eValidOpcodes {
			LEA = 0x8D
		};

	protected:
		Lea(Prefix* pre, std::string text, std::string inst, int op);
};
