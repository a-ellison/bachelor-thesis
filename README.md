# Tighter Security for Group Key Agreement in the Random Oracle Model ([thesis](./thesis.pdf), [slides](./presentation/presentation.pdf))

## Abstract 

The Messaging Layer Security (MLS) protocol, recently standardized in RFC 9420 [[1]][rfc9420], aims to provide efficient asynchronous group key establishment with strong security guarantees. The main component of MLS, which is the source of its important efficiency and security properties, is a protocol called TreeKEM [[2]][treekem]. Given that a major vision for the MLS protocol is for it to become the new standard for messaging applications like WhatsApp, Facebook Messenger, Signal, etc., it has the potential to be used by a huge number of users. Thus, it is important to better understand the security of MLS and hence also of TreeKEM. In [[3]][ttkem], TreeKEM was proven adaptively secure in the Random Oracle Model (ROM) with a polynomial loss in security by proving a result about the security of an arbitrary IND-CPA secure public-key encryption scheme in a public-key version of the Generalized Selective Decryption (GSD) security game [[4]][gsd].

In this work, we prove a tighter bound for the security of TreeKEM. We follow the approach in [[3]][ttkem] and first introduce a modified version of the public-key GSD game better suited for analyzing TreeKEM. We then provide a simple and detailed proof of security for a specific encryption scheme, the DHIES scheme (currently the only standardized scheme in MLS), in this game in the ROM and achieve a tighter bound compared to the result in [[3]][ttkem]. We also define and describe the syntax and security of TreeKEM-like schemes and state a result linking the security of TreeKEM with security in our GSD game in the ROM.

[rfc9420]: https://www.rfc-editor.org/rfc/rfc9420.html
[treekem]: https://inria.hal.science/hal-02425247
[ttkem]: https://eprint.iacr.org/2019/1489
[gsd]: https://iacr.org/archive/tcc2007/43920021/43920021.pdf 
