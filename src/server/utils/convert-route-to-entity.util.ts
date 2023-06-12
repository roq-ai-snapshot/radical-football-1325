const mapping: Record<string, string> = {
  academies: 'academy',
  'parent-access-requests': 'parent_access_request',
  'performance-evaluations': 'performance_evaluation',
  'player-profiles': 'player_profile',
  'training-sessions': 'training_session',
  users: 'user',
};

export function convertRouteToEntityUtil(route: string) {
  return mapping[route] || route;
}
