/* Linker script for TI Stellaris LM4F series
 * vim: sts=2 sw=2 et:
 */

MEMORY
{
  flash    (rix) : ORIGIN = 0x00000000, LENGTH = 0x00040000
  rom      (rix) : ORIGIN = 0x01000000, LENGTH = 0x1f000000
  sram     (rwx) : ORIGIN = 0x20000000, LENGTH = 0x00008000
  peri     (rw ) : ORIGIN = 0x40000000, LENGTH = 0xa0000000
  privperi (rw ) : ORIGIN = 0xe0000000, LENGTH = 0x20000000
}

SECTIONS
{
  .reset :
  {
    /* Initial SP value */
    LONG( __stack )
    /* Interrupt Vectors */
    LONG( _reset         | 1 )
    LONG( _nmi           | 1 ) PROVIDE( _nmi           = _halt );
    LONG( _hardfault     | 1 ) PROVIDE( _hardfault     = _halt );
    LONG( _mmufault      | 1 ) PROVIDE( _mmufault      = _halt );
    LONG( _busfault      | 1 ) PROVIDE( _busfault      = _halt );
    LONG( _usagefault    | 1 ) PROVIDE( _usagefault    = _halt );
    . = . + 5 * 4;
    LONG( _svcall        | 1 ) PROVIDE( _svcall        = _halt );
    LONG( _debugmonitor  | 1 ) PROVIDE( _debugmonitor  = _halt );
    LONG( _pendsv        | 1 ) PROVIDE( _pendsv        = _halt );
    LONG( _systick       | 1 ) PROVIDE( _systick       = _halt );
    LONG( _irq_gpio_a    | 1 ) PROVIDE( _irq_gpio_a    = _halt );
    LONG( _irq_gpio_b    | 1 ) PROVIDE( _irq_gpio_b    = _halt );
    LONG( _irq_gpio_c    | 1 ) PROVIDE( _irq_gpio_c    = _halt );
    LONG( _irq_gpio_d    | 1 ) PROVIDE( _irq_gpio_d    = _halt );
    LONG( _irq_gpio_e    | 1 ) PROVIDE( _irq_gpio_e    = _halt );
    LONG( _irq_uart0     | 1 ) PROVIDE( _irq_uart0     = _halt );
    LONG( _irq_uart1     | 1 ) PROVIDE( _irq_uart1     = _halt );
    LONG( _irq_ssi0      | 1 ) PROVIDE( _irq_ssi0      = _halt );
    LONG( _irq_i2c0      | 1 ) PROVIDE( _irq_i2c0      = _halt );
    . = . + 5 * 4;
    LONG( _irq_adc0_0    | 1 ) PROVIDE( _irq_adc0_0    = _halt );
    LONG( _irq_adc0_1    | 1 ) PROVIDE( _irq_adc0_1    = _halt );
    LONG( _irq_adc0_2    | 1 ) PROVIDE( _irq_adc0_2    = _halt );
    LONG( _irq_adc0_3    | 1 ) PROVIDE( _irq_adc0_3    = _halt );
    LONG( _irq_watchdog  | 1 ) PROVIDE( _irq_watchdog  = _halt );
    LONG( _irq_timer_0a  | 1 ) PROVIDE( _irq_timer_0a  = _halt );
    LONG( _irq_timer_0b  | 1 ) PROVIDE( _irq_timer_0b  = _halt );
    LONG( _irq_timer_1a  | 1 ) PROVIDE( _irq_timer_1a  = _halt );
    LONG( _irq_timer_1b  | 1 ) PROVIDE( _irq_timer_1b  = _halt );
    LONG( _irq_timer_2a  | 1 ) PROVIDE( _irq_timer_2a  = _halt );
    LONG( _irq_timer_2b  | 1 ) PROVIDE( _irq_timer_2b  = _halt );
    LONG( _irq_acomp_0   | 1 ) PROVIDE( _irq_acomp_0   = _halt );
    LONG( _irq_acomp_1   | 1 ) PROVIDE( _irq_acomp_1   = _halt );
    . = . + 1 * 4;
    LONG( _irq_sysctrl   | 1 ) PROVIDE( _irq_sysctrl   = _halt );
    LONG( _irq_flash_eep | 1 ) PROVIDE( _irq_flash_eep = _halt );
    LONG( _irq_gpio_f    | 1 ) PROVIDE( _irq_gpio_f    = _halt );
    . = . + 2 * 4;
    LONG( _irq_uart2     | 1 ) PROVIDE( _irq_uart2     = _halt );
    LONG( _irq_ssi1      | 1 ) PROVIDE( _irq_ssi1      = _halt );
    LONG( _irq_timer_3a  | 1 ) PROVIDE( _irq_timer_3a  = _halt );
    LONG( _irq_timer_3b  | 1 ) PROVIDE( _irq_timer_3b  = _halt );
    LONG( _irq_i2c1      | 1 ) PROVIDE( _irq_i2c1      = _halt );
    . = . + 1 * 4;
    LONG( _irq_can0      | 1 ) PROVIDE( _irq_can0      = _halt );
    . = . + 3 * 4;
    LONG( _irq_hib       | 1 ) PROVIDE( _irq_hib       = _halt );
    LONG( _irq_usb       | 1 ) PROVIDE( _irq_usb       = _halt );
    . = . + 1 * 4;
    LONG( _irq_mdma_sw   | 1 ) PROVIDE( _irq_mdma_sw   = _halt );
    LONG( _irq_mdma_err  | 1 ) PROVIDE( _irq_mdma_err  = _halt );
    LONG( _irq_adc1_0    | 1 ) PROVIDE( _irq_adc1_0    = _halt );
    LONG( _irq_adc1_1    | 1 ) PROVIDE( _irq_adc1_1    = _halt );
    LONG( _irq_adc1_2    | 1 ) PROVIDE( _irq_adc1_2    = _halt );
    LONG( _irq_adc1_3    | 1 ) PROVIDE( _irq_adc1_3    = _halt );
    . = . + 5 * 4;
    LONG( _irq_ssi2      | 1 ) PROVIDE( _irq_ssi2      = _halt );
    LONG( _irq_ssi3      | 1 ) PROVIDE( _irq_ssi3      = _halt );
    LONG( _irq_uart3     | 1 ) PROVIDE( _irq_uart3     = _halt );
    LONG( _irq_uart4     | 1 ) PROVIDE( _irq_uart4     = _halt );
    LONG( _irq_uart5     | 1 ) PROVIDE( _irq_uart5     = _halt );
    LONG( _irq_uart6     | 1 ) PROVIDE( _irq_uart6     = _halt );
    LONG( _irq_uart7     | 1 ) PROVIDE( _irq_uart7     = _halt );
    . = . + 4 * 4;
    LONG( _irq_i2c2      | 1 ) PROVIDE( _irq_i2c2      = _halt );
    LONG( _irq_i2c3      | 1 ) PROVIDE( _irq_i2c3      = _halt );
    LONG( _irq_timer_4a  | 1 ) PROVIDE( _irq_timer_4a  = _halt );
    LONG( _irq_timer_4b  | 1 ) PROVIDE( _irq_timer_4b  = _halt );
    . = . + 20 * 4;
    LONG( _irq_timer_5a  | 1 ) PROVIDE( _irq_timer_5a  = _halt );
    LONG( _irq_timer_5b  | 1 ) PROVIDE( _irq_timer_5b  = _halt );
    LONG( _irq_wtimer_0a | 1 ) PROVIDE( _irq_wtimer_0a = _halt );
    LONG( _irq_wtimer_0b | 1 ) PROVIDE( _irq_wtimer_0b = _halt );
    LONG( _irq_wtimer_1a | 1 ) PROVIDE( _irq_wtimer_1a = _halt );
    LONG( _irq_wtimer_1b | 1 ) PROVIDE( _irq_wtimer_1b = _halt );
    LONG( _irq_wtimer_2a | 1 ) PROVIDE( _irq_wtimer_2a = _halt );
    LONG( _irq_wtimer_2b | 1 ) PROVIDE( _irq_wtimer_2b = _halt );
    LONG( _irq_wtimer_3a | 1 ) PROVIDE( _irq_wtimer_3a = _halt );
    LONG( _irq_wtimer_3b | 1 ) PROVIDE( _irq_wtimer_3b = _halt );
    LONG( _irq_wtimer_4a | 1 ) PROVIDE( _irq_wtimer_4a = _halt );
    LONG( _irq_wtimer_4b | 1 ) PROVIDE( _irq_wtimer_4b = _halt );
    LONG( _irq_wtimer_5a | 1 ) PROVIDE( _irq_wtimer_5a = _halt );
    LONG( _irq_wtimer_5b | 1 ) PROVIDE( _irq_wtimer_5b = _halt );
    LONG( _irq_sysexcept | 1 ) PROVIDE( _irq_sysexcept = _halt );
    . = . + 32 * 4;
  } >flash = 0

  .init :
  {
    /* needed ??? */
    KEEP( *( .init ) )
  } >flash = 0

  .text :
  {
    /* *( .text.unlikely .text.*_unlikely ) */
    /* *( .text.hot .text.hot.* ) */
    *( .text .text.* )
  } >flash = 0

  .fini :
  {
    KEEP( *( .fini ) )
  } >flash = 0

  /*	PROVIDE( _etext = . ); */

/*
  .preinit_array :
  {
    PROVIDE_HIDDEN( __preinit_array_start = . );
    KEEP( *( .preinit_array ) )
    PROVIDE_HIDDEN( __preinit_array_end = . );
  } >flash = 0 */

  .init_array :
  {
    /* table for __attribute__((constructor)) */
    PROVIDE_HIDDEN( __init_array_start = . );
    KEEP( *( SORT( .init_array.* ) ) )  /* Prioritized */
    KEEP( *( .init_array ) )            /* Non prioritized */
    PROVIDE_HIDDEN( __init_array_end = . );
  } >flash = 0

  .fini_array :
  {
    /* table for __attribute__((destructor)) */
    PROVIDE_HIDDEN( __fini_array_start = . );
    KEEP( *( SORT( .fini_array.* ) ) )  /* Prioritized */
    KEEP( *( .fini_array ) )            /* Non prioritized */
    PROVIDE_HIDDEN( __fini_array_end = . );
  } >flash = 0

  .rodata :
  {
    *( .rodata .rodata.* )
    SORT( CONSTRUCTORS )
  } >flash

  .data :
  {
    __data_start = . ;
    *( .data .data.* )
    . = ALIGN( 4 );
    __data_end = . ;
  } >sram AT>flash
  __data_source = LOADADDR( .data );

  /*  PROVIDE( _edata = . );*/
  /*  .romfill : { . = LENGTH(flash) - 3389; BYTE(0) } >flash = 0*/
  /*  PROVIDE( __bss_start__ = . );*/
  .bss :
  {
    __bss_start = . ;
    *( .bss .bss.* )
    *( COMMON )
    . = ALIGN(4);
    __bss_end = . ;
  } >sram

  PROVIDE( __stack = ORIGIN(sram) + LENGTH(sram) );
  /DISCARD/ : { }
}

