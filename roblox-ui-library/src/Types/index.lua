local Types = {}

Types.Window = {
    Title = "string",
    Size = "Vector2",
    IsOpen = "boolean",
}

Types.Page = {
    Name = "string",
    Sections = "table",
    IsVisible = "boolean",
}

Types.Section = {
    Title = "string",
    Components = "table",
}

Types.Toggle = {
    Label = "string",
    State = "boolean",
    OnToggle = "function",
}

Types.Button = {
    Label = "string",
    OnClick = "function",
}

Types.Slider = {
    Label = "string",
    Value = "number",
    MinValue = "number",
    MaxValue = "number",
    OnValueChanged = "function",
}

Types.TextBox = {
    PlaceholderText = "string",
    Text = "string",
    OnTextChanged = "function",
}

Types.Dropdown = {
    Options = "table",
    SelectedOption = "string",
    OnOptionSelected = "function",
}

return Types