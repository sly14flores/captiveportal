<?php

class devices {
	
	var $con;
	var $ip;
	var $tok; # NDS token
	var $mac;
	var $nds_ip_port;
	
	function __construct($con,$ip,$tok) {
		
		$this->con = $con;
		$this->ip = $ip;
		$this->tok = $tok;
		$this->mac = $this->get_mac();
		$this->nds_ip_port = "http://192.168.10.1:2050/";
		
	}
	
	public function get_mac() {
		
		$arp = "/usr/sbin/arp";

		$mac = shell_exec("$arp -an " . $this->ip);
		preg_match('/..:..:..:..:..:../',$mac , $matches);
		$mac = @$matches[0];
		
		return strtoupper($mac);
	
	}

	public function check_device($student) {

		$status = null;

		$device = $this->con->getData("SELECT * FROM devices WHERE student_id = ".$student['id']." AND mac_address = '".$this->mac."'");
		
		if (count($device)==0) {
	
			$status = $this->new_device($student);
			
		} else {

			$status = $this->old_device($device[0]);			
		
		};

		return $status;
		
	}
	
	private function new_device($student) {
		
		$get_hours_allowed = $this->con->getData("SELECT property_value FROM settings WHERE property_description = 'internet_duration'");
		
		$hours_allowed = (count($get_hours_allowed))?$get_hours_allowed[0]['property_value']:1;
		
		$this->con->table = "devices";
		$new = $this->con->insertData(array("student_id"=>$student['id'],"mac_address"=>$this->mac,"ip_address"=>$this->ip,"tok"=>$this->tok,"is_active"=>1,"system_log"=>"CURRENT_TIMESTAMP","session_datetime"=>"CURRENT_TIMESTAMP","hours_allowed"=>$hours_allowed));		
		
		return "new";
		
	}
	
	private function old_device($device) {
		
		$today = date("Y-m-d");
		$session_date = date("Y-m-d",strtotime($device['session_datetime']));
		
		if ($today === $session_date) { # same day session
			
			# update ip & NDS token
			$this->con->table = "devices";
			$old = $this->con->updateData(array("id"=>$device['id'],"ip_address"=>$this->ip,"tok"=>$this->tok),'id');			
			
			# check if inactive / blocked
			if ($device['is_active']==0) {				
				
				return "inactive";
				
			};

			# check expiration
			$now = date("Y-m-d H:i:s");
			$session_datetime = date("Y-m-d H:i:s",strtotime("+$device[hours_allowed] Hour",strtotime($device['session_datetime'])));

			if ( (strtotime($session_datetime)<strtotime($now)) && ($device['unlimited']==0) ) {				
				
				return "expired";
				
			};	
			
			return "old";			
			
		} else { # new day session

			$this->con->table = "devices";
			$old = $this->con->updateData(array("id"=>$device['id'],"ip_address"=>$this->ip,"tok"=>$this->tok,"session_datetime"=>"CURRENT_TIMESTAMP"),'id');			
			
			return "old";	
		
		};
	
	}
	
	private function bypass() {
		
		// exec("sudo iptables -I internet 1 -t mangle -m mac --mac-source ".$this->mac." -j RETURN");
		// exec("sudo rmtrack " . $this->ip);

		return file_get_contents($this->nds_ip_port."nodogsplash_auth/?tok=".$this->tok."&redir=");
		
	}	

	private function check_expiration() {
		
	}
	
	private function kick() {
	
		// exec("sudo iptables -D internet -t mangle -m mac --mac-source ".$this->mac." -j RETURN");
		// exec("sudo rmtrack " . $this->ip);
		
		return file_get_contents($this->nds_ip_port."nodogsplash_deny/?tok=".$this->tok."&redir=");		
		
	}	
	
};

?>