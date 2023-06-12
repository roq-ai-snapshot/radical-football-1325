import { UserInterface } from 'interfaces/user';
import { GetQueryInterface } from 'interfaces';

export interface ParentAccessRequestInterface {
  id?: string;
  parent_id: string;
  player_id: string;
  status: string;
  created_at?: any;
  updated_at?: any;

  user_parent_access_request_parent_idTouser?: UserInterface;
  user_parent_access_request_player_idTouser?: UserInterface;
  _count?: {};
}

export interface ParentAccessRequestGetQueryInterface extends GetQueryInterface {
  id?: string;
  parent_id?: string;
  player_id?: string;
  status?: string;
}
