class Utils:
  @staticmethod
  def remove_whitespace(text: str) -> str:
    """"Remove all excess whitespeaces in a given input text."""
    return ' '.join(text.split())
