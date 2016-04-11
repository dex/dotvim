# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',
'-Wextra',
'-Werror',
#'-Wc++98-compat',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
# You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
# source code needs it.
#'-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c99',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
#'-x',
#'c++',
#'-isystem',
#'../BoostParts',
#'-isystem',
# This path will only work on OS X, but extra paths that don't exist are not
# harmful
#'/System/Library/Frameworks/Python.framework/Headers',
#'-isystem',
#'../llvm/include',
#'-isystem',
#'../llvm/tools/clang/include',
'-I',
'.',
'-D_POSIX_SOURCE',
'-D__GNUC__',
'-D__USE_BSD',
#'-I',
#'./ClangCompleter',
#'-isystem',
#'./tests/gmock/gtest',
#'-isystem',
#'./tests/gmock/gtest/include',
#'-isystem',
#'./tests/gmock',
#'-isystem',
#'./tests/gmock/include',
#'-isystem',
#'/usr/include',
#'-isystem',
#'/usr/local/include',
#'-isystem',
#'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1',
#'-isystem',
#'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
# For Video54
'-D_REENTRANT',
'-DLIBRSM',
'-DLINUX',
'-D__NOSUDO__',
#'-MD',
'-DLINUX',
'-DKERNEL_VERSION_26',
'-DCONFIG_BRIDGE_VLAN',
'-DV54',
'-DV54_AP_IE',
'-DV54_CWMIN_ADAPT',
'-DV54_11N',
'-DRKS_11N',
'-DRKS_APSTA_COEXISTENCE',
'-DRKS_EXT_MACAUTH',
'-DV54_SCAN_MODULE',
'-DMADWIFI_PCI_BUS',
'-DRKS_WMM_AC',
'-DV54_AUTOPROV',
'-DV54_BRIDGE_DHCP_HOOK',
'-DV54_BRIDGE_PACKET_INSPECTION_FILTER_HOOK',
'-DV54_CLIENT_ISOLATION_FILTER_HOOK',
'-DV54_CHANNELFLY',
'-DV54_SSH',
'-DRKS_SSHTUNNEL',
'-DV54_LLDPD',
'-DRKS_HOSTAPD_FULLCTRL',
'-DRKS_HOSTAPD_DVLAN',
'-DRKS_HOSTAPD_DGAF',
'-DRKS_HOTSPOT_NG',
'-DV54_TRAFFIC_SHAPING',
'-DV54_OEM',
'-DV54_BKGND_SCAN',
'-DV54_DATA_COLLECTION',
'-DV54_LIBRSM_DEVICE_POLICY',
'-DV54_LIBRSM_RUDB',
'-DV54_LIBRSM_DNSSPOOF',
'-DV54_LIBRSM_DRAM_64MB',
'-DV54_SYSINFO_ARCHIVE',
'-DRKS_MEMCACHED',
'-DV54_IDM',
'-DRKS_AUTHD',
'-DV54_MESH',
'-DRKS_WMM_AC',
'-DV54_SNMP',
'-DV54_SNMP_V3',
'-DV54_L2TP',
'-DV54_SSL',
'-DV54_PPPD',
'-DRKS_REMOTECLID',
'-DV54_RFMD',
'-DV54_AEROSCT',
'-DV54_EKAHAU',
'-DRKS_HS20',
'-DV54_SNTP',
'-DV54_SMART_MONITOR',
'-DV54_EVED',
'-DV54_TACPLUS',
'-DV54_TUNNELMGR',
'-DV54_HTTP',
'-DV54_HTTPS',
'-DRKS_WSG',
'-DV54_ROGUED',
'-DV54_WSGCLIENT',
'-DV54_CPD',
'-DRKS_STA_INFO_EXTRACTION',
'-DV54_KERNEL_2_6_32',
'-DV54_TELNET',
'-DV54_IPSEC_NG',
'-isystem',
'buildroot/tools/2.6.32.24_gcc4.3.5/include',
'-I',
'video54/lib/librsm/include',
'-I',
'atheros/linux/driver/rks_include',
'-I',
'video54/lib/libRutil',
'-I',
'atheros/linux/driver/rudb',
'-I',
'atheros/linux/driver/madwifi',
'-I',
'include',
'-I',
'src/include',
'-I',
'atheros/linux/driver/rks_include',
'-I',
'/usr/include/luajit-2.0',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, client_data, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    #try:
    #  final_flags.remove( '-stdlib=libc++' )
    #except ValueError:
    #  pass
  else:
    #relative_to = DirectoryOfThisScript()
    relative_to = client_data['getcwd()']
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
