# SoC integration top level
include .
file soc.v

# CPU + Debug Module components
list $HDL_LIB/hazard3/hdl/hazard3.f
list $HDL_LIB/hazard3/hdl/debug/dm/hazard3_dm.f

# DAP components
list $HDL_LIB/opendap/hdl/opendap_sw_dp.f
list $HDL_LIB/opendap/hdl/opendap_mem_ap_apb.f

# Generic SoC components from libfpga
file $HDL_LIB/libfpga/common/reset_sync.v

list $HDL_LIB/libfpga/peris/uart/uart.f
list $HDL_LIB/libfpga/peris/spi_03h_xip/spi_03h_xip.f
list $HDL_LIB/libfpga/mem/ahb_cache.f
list $HDL_LIB/libfpga/mem/ahb_sync_sram.f

list $HDL_LIB/libfpga/busfabric/ahbl_crossbar.f
file $HDL_LIB/libfpga/busfabric/ahbl_to_apb.v
file $HDL_LIB/libfpga/busfabric/apb_splitter.v

list $HDL_LIB/hazard3/example_soc/soc/peri/hazard3_riscv_timer.f
