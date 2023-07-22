ENTRY(start) 

SECTIONS 
{ 
    . = 0x7C00; 
    .boot : AT(0x7C00) 
    { 
        *(.boot); 
    } 

    .text : AT(0x7E00)
    { 
        *(.text); 
    }
}
