# forth-psoc-utils

## usage

    objcopy -I ihex --output-target=binary config.hex config.bin
    gforth configdump.4th config.bin <number_of_base_addresses> -e bye

