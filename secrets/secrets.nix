let
	laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILMUehW03APcqoyeFNbumRwJ3MSVIP4cfilrxPLfKixe";
in
{
	"rclone_client_id.age".publicKeys = [ laptop ];
	"rclone_client_secret.age".publicKeys = [ laptop ];
  "rclone_token.age".publicKeys = [ laptop ];
}
