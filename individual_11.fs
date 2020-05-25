open System
open System.Drawing
open System.IO
open System.Windows.Forms

let form = new Form(Width= 400, Height = 200, Text = "F#  Главная форма")
let flag1 = new CheckBox(Text="1 флажок", Top=10, Left=20)
let flag2 = new CheckBox(Text="2 флажок", Top=50, Left=20)
let button = new Button(Text="Проверить флажки", Left=200, Top=35, Width=150)
form.Controls.Add(flag1)
form.Controls.Add(flag2)
form.Controls.Add(button)
let textbox = new TextBox(Top=100, Left=30, Width=200, Text="")
form.Controls.Add(textbox)

let buttonclick _ = 
    if (flag1.Checked=true && flag2.Checked=false) then
        textbox.Text<-"Поставлен 1 флажок"
    if (flag1.Checked=false && flag2.Checked=true) then
        textbox.Text<-"Поставлен 2 флажок"
    if (flag1.Checked=true && flag2.Checked=true) then
        textbox.Text<-"Поставлены оба флажка"
    if (flag1.Checked=false && flag2.Checked=false) then
        textbox.Text<-"Флажки не установлены"
    form.Controls.Remove(textbox)
	form.Controls.Add(textbox)
    |> ignore

let _ = button.Click.Add(buttonclick)


[<EntryPoint>]
let main argv =
    do Application.Run(form)
    0 // return an integer exit code
