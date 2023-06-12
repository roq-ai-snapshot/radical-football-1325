import { UserInterface } from 'interfaces/user';
import { AcademyInterface } from 'interfaces/academy';
import { GetQueryInterface } from 'interfaces';

export interface PerformanceEvaluationInterface {
  id?: string;
  player_id: string;
  coach_id: string;
  academy_id: string;
  date: any;
  evaluation: string;
  created_at?: any;
  updated_at?: any;

  user_performance_evaluation_player_idTouser?: UserInterface;
  user_performance_evaluation_coach_idTouser?: UserInterface;
  academy?: AcademyInterface;
  _count?: {};
}

export interface PerformanceEvaluationGetQueryInterface extends GetQueryInterface {
  id?: string;
  player_id?: string;
  coach_id?: string;
  academy_id?: string;
  evaluation?: string;
}
