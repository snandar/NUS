#!/usr/bin/env python3
"""Python Template for task 4 of CS4238 HW3
    Usage: HW3_template.py <pe_file>
    Dependeny:  python3, pefile, requests(optional)
"""

# Import Python Utils
import os.path
from re import I

# Import Pefile related pacakges
import pefile
import peutils

def get_file_type(pe):
    if pe.is_exe():
        return "EXE"
    if pe.is_dll():
        return "DLL"
    if pe.is_driver():
        return "SYS"
    return "UNKNOWN"

def count_dlls(pe):
    i = 0
    for entry in pe.DIRECTORY_ENTRY_IMPORT:
        i = i+1
    return i

def count_fns(pe):
    i = 0
    for entry in pe.DIRECTORY_ENTRY_IMPORT:
        for func in entry.imports:
            i = i+1
    
    return i



def get_compile_time(pe):
    return pe.FILE_HEADER.dump_dict()['TimeDateStamp']['Value'].split('[')[1][:-1]

def get_valid_section_entry(pe):
    valid_sections = [".text",".code","CODE","INIT"]
    entry = ""
    valid = False
    for section in pe.sections:
        if section.Name.decode().rstrip('\x00') == valid_sections[0]:
            entry = entry + valid_sections[0] + " "
            valid = True
        if section.Name.decode().rstrip('\x00') == valid_sections[1]:
            entry = entry + valid_sections[1] + " "
            valid = True
        if section.Name.decode().rstrip('\x00') == valid_sections[2]:
            entry = entry + valid_sections[2] + " "
            valid = True
        if section.Name.decode().rstrip('\x00') == valid_sections[3]:
            entry = entry + valid_sections[3] + " "
            valid = True
    
    if valid == False:
        return "Entry point NOT VALID."
    return entry

def signature_match(pe, PEiD_database):
    signatures = peutils.SignatureDatabase(data=PEiD_database)
    matches = signatures.match_all(pe, ep_only=True)
    result = ''

    if matches != None:
            for match in matches:
                m = ','.join(match)
                result  = result+m
            return result
    else:
        return None

packers_sections = {
        #The packer/protector/tools section names/keywords
        '.aspack': 'Aspack packer',
        '.adata': 'Aspack packer/Armadillo packer',
        'ASPack': 'Aspack packer',
        '.ASPack': 'ASPAck Protector',
        '.boom': 'The Boomerang List Builder (config+exe xored with a single byte key 0x77)',
        '.ccg': 'CCG Packer (Chinese Packer)',
        '.charmve': 'Added by the PIN tool',
        'BitArts': 'Crunch 2.0 Packer',
        'DAStub': 'DAStub Dragon Armor protector',
        '!EPack': 'Epack packer',
        'FSG!': 'FSG packer (not a section name, but a good identifier)',
        '.gentee': 'Gentee installer',
        'kkrunchy': 'kkrunchy Packer',
        '.mackt': 'ImpRec-created section',
        '.MaskPE': 'MaskPE Packer',
        'MEW': 'MEW packer',
        '.MPRESS1': 'Mpress Packer',
        '.MPRESS2': 'Mpress Packer',
        '.neolite': 'Neolite Packer',
        '.neolit': 'Neolite Packer',
        '.nsp1': 'NsPack packer',
        '.nsp0': 'NsPack packer',
        '.nsp2': 'NsPack packer',
        'nsp1': 'NsPack packer',
        'nsp0': 'NsPack packer',
        'nsp2': 'NsPack packer',
        '.packed': 'RLPack Packer (first section)',
        'pebundle': 'PEBundle Packer',
        'PEBundle': 'PEBundle Packer',
        'PEC2TO': 'PECompact packer',
        'PECompact2': 'PECompact packer (not a section name, but a good identifier)',
        'PEC2': 'PECompact packer',
        'pec1': 'PECompact packer',
        'pec2': 'PECompact packer',
        'PEC2MO': 'PECompact packer',
        'PELOCKnt': 'PELock Protector',
        '.perplex': 'Perplex PE-Protector',
        'PESHiELD': 'PEShield Packer',
        '.petite': 'Petite Packer',
        'petite': 'Petite Packer',
        '.pinclie': 'Added by the PIN tool',
        'ProCrypt': 'ProCrypt Packer',
        '.RLPack': 'RLPack Packer (second section)',
        '.rmnet': 'Ramnit virus marker',
        'RCryptor': 'RPCrypt Packer',
        '.RPCrypt': 'RPCrypt Packer',
        '.seau': 'SeauSFX Packer',
        '.sforce3': 'StarForce Protection',
        '.spack': 'Simple Pack (by bagie)',
        '.svkp': 'SVKP packer',
        'Themida': 'Themida Packer',
        '.Themida': 'Themida Packer',
        'Themida ': 'Themida Packer',
        '.taz': 'Some version os PESpin',
        '.tsuarch': 'TSULoader',
        '.tsustub': 'TSULoader',
        '.packed': 'Unknown Packer',
        'PEPACK!!': 'Pepack',
        '.Upack': 'Upack packer',
        '.ByDwing': 'Upack Packer',
        'UPX0': 'UPX packer',
        'UPX1': 'UPX packer',
        'UPX2': 'UPX packer',
        'UPX!': 'UPX packer',
        '.UPX0': 'UPX Packer',
        '.UPX1': 'UPX Packer',
        '.UPX2': 'UPX Packer',
        '.vmp0': 'VMProtect packer',
        '.vmp1': 'VMProtect packer',
        '.vmp2': 'VMProtect packer',
        'VProtect': 'Vprotect Packer',
        '.winapi': 'Added by API Override tool',
        'WinLicen': 'WinLicense (Themida) Protector',
        '_winzip_': 'WinZip Self-Extractor',
        '.WWPACK': 'WWPACK Packer',
        '.yP': 'Y0da Protector',
        '.y0da': 'Y0da Protector',
    }
packers_sections_lower =  {x.lower(): x for x in packers_sections.keys()}

def get_entropy(section):
    section_name = section.Name.decode().rstrip('\x00')

    # Your code here
    entropy = section.get_entropy()

    suspect_packed = False
    print("\t ", section_name, ": ", entropy, end=" ")

    if section_name.lower() in packers_sections_lower.keys():
        suspect_packed == True
        print("Suspect packed")
    else:
        print()
    return



def is_zero_sized(section):
    data = section.get_data()
    try:
        # newbytes' count() takes a str in Python 2
        count = data.count("\0")
    except TypeError:
        # bytes' count() takes an int in Python 3
        count = data.count(0)

    if count == len(data):
        return True
    
    return False

def verify_checksum(pe):
    return pe.verify_checksum()


def dump_rsrc(pe, dump_path):
    # If no resource section, return false;
    ret = {}
    if not hasattr(pe, 'DIRECTORY_ENTRY_RESOURCE'):
        return False
    # Otherwise, dump the first one to dump_path and return True.
    else:
        #For all possible resources
        for resource_type in pe.DIRECTORY_ENTRY_RESOURCE.entries:
            if resource_type.name is not None:
                name = "%s" % resource_type.name
            else:
                name = "%s" % pefile.RESOURCE_TYPE.get(resource_type.struct.Id)
            if name == None:
                name = "%d" % resource_type.struct.Id

            if hasattr(resource_type, 'directory'):

                #Try
                # resource_entry = resource_type.directory.entries[0]
                # resource_entry_directory = pe.parse_resource_entry(resource_entry.struct.OffsetToDirectory)
                # resource_entry_data = pe.parse_resource_data_entry(resource_entry.struct.OffsetToData)
                # print(resource_entry_data)
                # print(resource_entry_directory)

                ##Manual Loop through first resource
                resource_id = resource_type.directory.entries[0]
                if hasattr(resource_id, 'directory'):
                    for resource_lang in resource_id.directory.entries:
                        data = pe.get_data(resource_lang.data.struct.OffsetToData, resource_lang.data.struct.Size)
                        lang = pefile.LANG.get(resource_lang.data.lang, '*unknown*')
                        sublang = pefile.get_sublang_name_for_lang(resource_lang.data.lang, resource_lang.data.sublang )
                        ret[0] = (name, resource_lang.data.struct.OffsetToData, resource_lang.data.struct.Size, lang, sublang)
        
        #print(ret)
        f = open(dump_path, "a")
        f.write(str(ret))
        f.close()
        return True                



def get_database():
    # Here we use requests package. 
    # If you prefer offline access, just rewrite this function.
    import requests
    database = 'https://raw.githubusercontent.com/cuckoosandbox/cuckoo/master/cuckoo/private/peutils/UserDB.TXT'
    request = requests.get(database, allow_redirects = True)
    return request.text


def main():
    # Print you Matrix ID and name
    student_id = "A0236589L"
    student_name = "Nandar Soe"
    print("Assignment 3:", student_id, student_name)

    # Take a PE format file inputted from the command line
    print("[1]\tAnalysing file", os.sys.argv[1])
    pe = pefile.PE(os.sys.argv[1])

    # 1. Output the following to standard output:
    #   a. Identify the file type as DLL or EXE or SYS regardless of the file’s extension.
    print("[2.a]\tFile type:", get_file_type(pe))
    #   b. Total number of imported DLLs.
    print("[2.b]\t#DLLs:", count_dlls(pe))
    #   c. Total number of imported functions.
    print("[2.b]\t#FNs:", count_fns(pe))
    #   d. Output the compile time.
    print("[3]\tCompile Time:", get_compile_time(pe))

    # 2. Alert the user if the entry point of the code is not in a section with 
    #    the name “.text”, “.code”, “CODE”, or “INIT”.
    section_name = get_valid_section_entry(pe)
    if not section_name:
        print("[4]\tEntry point not found in valid sections.")
    else:
        print("[4]\tEntry point found in", section_name)

    # 3. Automatically use the PEiD database that comes with pefile to identify 
    #    packers. Confirm that this works with UPX. Output the detection to standard output.
    PEiD_database = get_database()
    print("[5]\tPacker detected:", signature_match(pe, PEiD_database))

    # 4. Calculate and output the entropy for each section. Alert the user when you 
    #    suspect that a section maybe packed or compressed.
    print("[6]\tEntropy for sections...")
    for section in pe.sections:
        get_entropy(section)
    
    # 5. Alert the user when there is a zero sized section.
    print("[7]\tZero sized sections...")
    has_zero_sections = False
    for section in pe.sections:
        if is_zero_sized(section):
            print("\t  ",section.Name.decode().rstrip('\x00'))
            has_zero_sections = True
    if not has_zero_sections:
        print("\t  No zero sized section found.")

    # 6. Compare the PE Optional Header checksum with the actual checksum. Alert the user
    #    when they don’t match up.
    print("[8]\tChecksum matched:", verify_checksum(pe))

    

    # 7. If there is a resource section, dump the first resource (of any type) to a file 
    #    on disk.
    dump_path = "resource.txt"
    if (dump_rsrc(pe, dump_path)):
        print("[9]\tDumped the first resource section to", dump_path)
    else:
        print("[9]\tNo resource section has been found")

    # End of script. Well done!
    return


if __name__ == "__main__":
    main()