#ifndef JUSTOS_STDINT_H
#define JUSTOS_STDINT_H

// Integer Types
typedef unsigned char	u8;
typedef unsigned short	u16;
typedef unsigned int	u32;
typedef unsigned long	u64;

typedef signed char	i8;
typedef signed short	i16;
typedef signed int	i32;
typedef signed long	i64;

// Misc Types
typedef void*		void_ptr;

typedef const char*	str_ptr;
typedef char*		mut_str_ptr;

typedef _Bool		bool;

#define NULL		((void_ptr)0)

#define TRUE		((bool)1)
#define FALSE		((bool)0)

// Useful info
#define U8_MAX		((u8)0xFF)
#define U16_MAX		((u16)0xFFFF)
#define U32_MAX		((u32)0xFFFFFFFF)
#define U64_MAX		((u64)0xFFFFFFFFFFFFFFFF)

#define I8_MAX		((i8)0x7F)
#define I16_MAX		((i16)0x7FFF)
#define I32_MAX		((i32)0x7FFFFFFF)
#define I64_MAX		((i64)0x7FFFFFFFFFFFFFFF)

#define U8_MIN		((u8)0x00)
#define U16_MIN		((u16)0x0000)
#define U32_MIN		((u32)0x00000000)
#define U64_MIN		((u64)0x0000000000000000)

#define I8_MIN		((i8)0x80)
#define I16_MIN		((i16)0x8000)
#define I32_MIN		((i32)0x80000000)
#define I64_MIN		((i64)0x8000000000000000)

#define U8_BITS		((u32)8)
#define U16_BITS	((u32)16)
#define U32_BITS	((u32)32)
#define U64_BITS	((u32)64)

#define I8_BITS		((u32)8)
#define I16_BITS	((u32)16)
#define I32_BITS	((u32)32)
#define I64_BITS	((u32)64)

#endif

