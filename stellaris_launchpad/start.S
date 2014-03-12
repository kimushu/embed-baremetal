
	.text
.global	_reset
_reset:
	/* Initialize .data section */
	ldr		r0, _ds		/* __data_start */
	ldr		r1, _dsr	/* __data_source */
	ldr		r2, _de		/* __data_end */
	sub		r2, r3		/* __data_end - __data_start */
	bl		memcpy
	/* Initialize .bss section */
	ldr		r0, _bs		/* __bss_start */
	ldr		r2, _be		/* __bss_end */
	sub		r2, r0		/* __bss_end - __bss_start */
	movs	r1, #0
	bl		memset
	/* Execute init routines */
	ldr		r4, _is
	ldr		r5, _ie
	b		2f
1:	ldr		r3, [r4]
	blx		r3
	add		r4, #4
2:	cmp		r5, r4
	bhi		1b
	/* Start main */
	movs	r0, #0
	bl		main
	/* Execute fini routines */
	ldr		r4, _fs
	ldr		r5, _fe
	b		2f
1:	ldr		r3, [r4]
	blx		r3
	add		r4, #4
2:	cmp		r5, r4
	bhi		1b
	/* Stop */
	b		_halt

	.balign	4
	_ds:	.long	__data_start
	_de:	.long	__data_end
	_dsr:	.long	__data_source
	_bs:	.long	__bss_start
	_be:	.long	__bss_end
	_is:	.long	__init_array_start
	_ie:	.long	__init_array_end
	_fs:	.long	__fini_array_start
	_fe:	.long	__fini_array_end

.global	_halt
_halt:
.global	_exit
_exit:
	b .

