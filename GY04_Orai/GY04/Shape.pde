
abstract class Shape
{
  int detailness = 20;
  PVector position = new PVector(0, 0);
  float scale = 1.0;
  float rotation = 0.0;
  
  abstract void Draw(); 
  abstract Boolean Contains(float x, float y);
  
  void SetPosition(PVector _pos) { position = _pos.get(); }
  void SetScale(float _scale) { scale = _scale; }
  void SetRotation(float _rot) { rotation = _rot; }
  
  PVector GetPosition() { return position.get(); }
  float GetScale() { return scale; }
  float GetRotation() { return rotation; }
};