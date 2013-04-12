/*-------------------------------------*\
|
|  File Name: Lahf.hpp
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

class Lahf : public Instruction8086 {
	public:
		static Instruction* CreateInstruction(Memory::MemoryOffset& memLoc, Processor* proc);
		int Execute();

		enum eValidOpcodes {
			LAHF = 0x9F
		};

	protected:
		Lahf(Prefix* pre, std::string text, std::string inst, int op);
};
