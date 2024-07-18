{
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  security.pki.certificates = [
    (builtins.readFile ./vcenter.pem)
  ];
}
