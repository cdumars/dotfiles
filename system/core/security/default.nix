{
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  security.pki.certificates = [
    (builtins.readFile ./vcenter.pem)
    ''
      -----BEGIN CERTIFICATE-----
      MIIDiDCCAnCgAwIBAgIUZBcZFIfcRrqtfQWMxRZuF8f001swDQYJKoZIhvcNAQEL
      BQAwcTELMAkGA1UEBhMCSE4xFzAVBgNVBAoMDmh5ZHJ1cyBuZXR3b3JrMUkwRwYD
      VQQLDEA3MDJmNjM5OTM3MDUwMTBmMjUwMTc2N2U3ZWM1NjFiMmNhZDI3ZGI3Y2Vl
      ZDgzZDQ5MTRlNjIwMmE0NGQ4ZjMyMB4XDTI1MDcyMjAyNDQyNFoXDTM1MDcyMDAy
      NDQyNFowcTELMAkGA1UEBhMCSE4xFzAVBgNVBAoMDmh5ZHJ1cyBuZXR3b3JrMUkw
      RwYDVQQLDEA3MDJmNjM5OTM3MDUwMTBmMjUwMTc2N2U3ZWM1NjFiMmNhZDI3ZGI3
      Y2VlZDgzZDQ5MTRlNjIwMmE0NGQ4ZjMyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
      MIIBCgKCAQEAyZFth1rntWnpghg94/z7dMpFpRuhUv2IWeXhDh0zw22iSlJbb4+E
      4pM5vd1B+wRIs/cCO+pBVrPYqLCWj4is6pOcXJr5jW0UFauD/9sYnJnjaXR2oZEX
      pf3fAfzeS38Fhr5Ql9FuWHNS+7w88nef62WUKQr2k3m/vHVDN5oic3eqGVTRr9cx
      FjvnZJKKNDj+cxMGF+FEQVG+u0G7HTShrVNuMkrMhp0gfnxhjI1q3Rac6xwqMnz0
      bLuBlHFIqAu7vWWpYJ/k87Hx0pDP9Ffz9C8RcgeXKvUDpVo7x4PhAuPzJVJX3mZB
      DeyCTJm7S6p67fGf9BRDr4uw/w1CrcnbPwIDAQABoxgwFjAUBgNVHREEDTALggls
      b2NhbGhvc3QwDQYJKoZIhvcNAQELBQADggEBAAVelfRlxBttH4jdrHi81u9Mke2Y
      8fmNV3r0+k891eC0VqZvlBDzCOnsFWxDGB+puEma4hQJbK6CthayeAMTGBUYXEe+
      pQ4iBgYO9r4vnXyu0GoXXIm5VgwQBnM+lfi/D6l5VcyoC7iZjgY99fDGMooR8zWu
      7pLo4B1IFbGjPYPUHYREFr7zlhj7mxOJE4QU2RC9VPh5V3bp6bv9dc+SDichDAK7
      ff25Y07/lzziLz99fF+sGy8ml/goWlOv80A1rPET+LXeqSQHOdeXR37VlgbpnsY9
      97cWLlaJtSeZJMuWPdAzA2Cved0rgl2CNurYOcQWMUC/r+nhoNcLT5T3/3A=
      -----END CERTIFICATE-----
    ''
  ];
}
