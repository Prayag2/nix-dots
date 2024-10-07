{ ... }: {
 fileSystems."/mnt/windows" = {
   device = "/dev/disk/by-uuid/01DA01E91F5AC0E0";
   mountPoint = "/mnt/windows";
   fsType = "auto";
   options = [ 
     "users"
     "nofail"
   ];
 };
}
