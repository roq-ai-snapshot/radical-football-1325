import { UserInterface } from 'interfaces/user';
import { AcademyInterface } from 'interfaces/academy';
import { GetQueryInterface } from 'interfaces';

export interface TrainingSessionInterface {
  id?: string;
  player_id: string;
  coach_id: string;
  academy_id: string;
  date: any;
  description?: string;
  created_at?: any;
  updated_at?: any;

  user_training_session_player_idTouser?: UserInterface;
  user_training_session_coach_idTouser?: UserInterface;
  academy?: AcademyInterface;
  _count?: {};
}

export interface TrainingSessionGetQueryInterface extends GetQueryInterface {
  id?: string;
  player_id?: string;
  coach_id?: string;
  academy_id?: string;
  description?: string;
}
