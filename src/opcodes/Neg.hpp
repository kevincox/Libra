/*-------------------------------------*\
|
|  File Name: Neg.hpp
|
|  Creation Date: 18-10-2012
|
|  Last Modified: Thurs, Oct 18, 2012  4:19:00 PM
|
|  Created By: Darren Stahl
|
\*-------------------------------------*/

#pragma once

#include "../Instruction8086.hpp"

class Neg : public Instruction8086 {

	public:
		static Instruction* CreateInstruction(Memory::MemoryOffset& memLoc, Processor* proc);
		int Execute();

		enum eValidOpcodes {
			NEG_MOD8	= 0xF6,
			NEG_MOD16	= 0xF7,
		};

	protected:
		Neg(Prefix* pre, std::string text, std::string inst, int op);
};
