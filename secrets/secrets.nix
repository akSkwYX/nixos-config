let
	laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILMUehW03APcqoyeFNbumRwJ3MSVIP4cfilrxPLfKixe";
  pc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxNoyOhVBLf14Z5CxWsbEDTFG7tbWTNjLCALTmhX3Mg";
in
{
	"rclone_client_id.age".publicKeys = [ laptop ];
	"rclone_client_secret.age".publicKeys = [ laptop ];
  "rclone_token.age".publicKeys = [ laptop ];
}
