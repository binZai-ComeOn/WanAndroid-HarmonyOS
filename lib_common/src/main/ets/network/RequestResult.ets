export interface RequestResult {
  OnSuccess: (data: object) => void;
  OnError: (error: string) => void;
}