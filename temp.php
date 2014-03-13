else 
				if (self::user_has_weekend($user_data->username, $days)) {
					$this->_calendar .= '<td class="user_data" id="off">OFF</td>';
				} else
				if (self::user_has_pto($user_data->username)){
					$this->_calendar .= '<td class="user_data" id="PTO">PTO</td>';
				}



				foreach(self::get_users_by_shift($shift->shift_name) as $user) {

				$this->_calendar .= '<tr class="shift_data_container">';

				if ($user->shift == $user->shift) {

					$this->_calendar .= '<td class="shift_name">'. $shift->shift_name .'</td>';

				} else {
					$this->_calendar .= '<td class="shift_name"></td>';
				}

			

				$current_day = $this->_counter - 7;

				//nr of days loop
				for ($days=0; $days<7;$days++) {
				
					$current_day = $current_day +1;
					$this->_currentDay = $current_day;

					
					if (self::user_is_active($user->username)){
						$this->_calendar .= '<td class="user_data" id="ON">'. $user->username .'</td>';
					} else {
						$this->_calendar .= '<td class="user_data" id="OFF">&nbsp;</td>';
					} 
				}

				$this->_calendar .= '</tr>';

			}














	