#!/usr/bin/env python3
"""Python Template for task 4 of CS4238 HW3
    Usage: HW3_template.py <pe_file>
    Dependeny:  python3, pefile, requests(optional)
"""

# Import Python Utils
import os.path

# Import Pefile related pacakges
import pefile
import peutils

def get_file_type(pe):
    # Example function
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
    pass

def get_compile_time(pe):
    pass

def get_valid_section_entry(pe):
    valid_sections = [".text",".code","CODE","INIT"]
    return ""

def signature_match(pe, PEiD_database):
    matches = []
    return matches

def get_entropy(section):
    section_name = section.Name.decode().rstrip('\x00')

    # Your code here
    entropy = 0 
    suspect_packed = False

    print("\t ", section_name, ": ", entropy, end=" ")
    if suspect_packed:
        print("(Packed?)")
    else:
        print()
    return

def is_zero_sized(section):
    return False

def verify_checksum(pe):
    return True

def dump_rsrc(pe, dump_path):
    # If no resource section, return false;
    # Otherwise, dump the first one to dump_path and return True.
    return False


def get_database():
    # Here we use requests package. 
    # If you prefer offline access, just rewrite this function.
    import requests
    database = 'https://raw.githubusercontent.com/cuckoosandbox/cuckoo/master/cuckoo/private/peutils/UserDB.TXT'
    request = requests.get(database, allow_redirects = True)
    return request.text


def main():
    # Print you Matrix ID and name
    student_id = "A0000001X"
    student_name = "My Name"
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