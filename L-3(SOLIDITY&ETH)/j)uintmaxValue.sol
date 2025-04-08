// maller Unsigned Integer Types (uint8 to uint256)
// Solidity also provides smaller uint types that use less storage and gas.

// Type	    Bits	Range        (Min to Max)
// uint8	     8	0 to 2^8 -   1 (0 to 255)
// uint16	     16	0 to 2^16 -  1 (0 to 65,535)
// uint32	     32	0 to 2^32 -  1 (0 to 4,294,967,295)
// uint64	     64	0 to 2^64 -  1 (0 to 18,446,744,073,709,551,615)
// uint128	128	0 to 2^128 - 1 (0 to 340,282,366,920,938,463,463,374,607,431,768,211,455)
// uint256	256	0 to 2^256 - 1 (Max: 115792089237316195423570985008687907853269984665640564039457584007913129639935)

// 🔹 What is bytes in Solidity?
// bytes is a dynamically-sized array of raw binary data (byte[]). It is useful for storing arbitrary-length data, such as encoded function calls or cryptographic signatures.

 // What is calldata in Solidity?
// calldata is a special data location for function parameters that are read-only and exist only during the execution of a transaction. It reduces gas costs because it doesn’t copy data into memory.