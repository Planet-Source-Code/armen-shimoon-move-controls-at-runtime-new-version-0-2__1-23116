VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MOVE CONTROL EXAMPLE  v0.2"
   ClientHeight    =   4980
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5880
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4980
   ScaleWidth      =   5880
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   450
      Top             =   2970
   End
   Begin VB.TextBox Text1 
      Height          =   555
      Left            =   1620
      TabIndex        =   3
      Text            =   "TextBox"
      Top             =   3150
      Width           =   2355
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame"
      Height          =   735
      Left            =   2880
      TabIndex        =   2
      Top             =   1890
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command Button"
      Height          =   735
      Left            =   180
      TabIndex        =   1
      Top             =   1890
      Width           =   2265
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "UPDATE: Settings are saved to the registry so that the next time you open the app, the customized interface will be restored."
      Height          =   735
      Left            =   180
      TabIndex        =   5
      Top             =   810
      Width           =   5505
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "SHIMOON SOFTWARE 2001© - V0.2"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   465
      Left            =   450
      TabIndex        =   4
      Top             =   4230
      Width           =   5235
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00C00000&
      FillColor       =   &H00C00000&
      FillStyle       =   0  'Solid
      Height          =   195
      Index           =   2
      Left            =   270
      Top             =   4680
      Width           =   2355
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00C00000&
      FillColor       =   &H00C00000&
      FillStyle       =   0  'Solid
      Height          =   195
      Index           =   1
      Left            =   270
      Top             =   3960
      Width           =   2355
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H00800000&
      FillColor       =   &H00800000&
      FillStyle       =   0  'Solid
      Height          =   735
      Left            =   360
      Shape           =   4  'Rounded Rectangle
      Top             =   4050
      Width           =   5415
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00C00000&
      FillColor       =   &H00C00000&
      FillStyle       =   0  'Solid
      Height          =   195
      Index           =   0
      Left            =   270
      Top             =   4680
      Width           =   2355
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00C0C000&
      FillColor       =   &H00C0C000&
      FillStyle       =   0  'Solid
      Height          =   735
      Left            =   -180
      Shape           =   3  'Circle
      Top             =   4050
      Width           =   1275
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF0000&
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   1095
      Left            =   0
      Top             =   3870
      Width           =   5865
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "With your right mouse button, drag any one of these controls around! MOVE CONTROL'S AT RUNTIME!"
      Height          =   645
      Left            =   180
      TabIndex        =   0
      Top             =   90
      Width           =   5505
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OldY As Integer
Dim OldX As Integer
Dim MoveControl As Boolean




'BUTTON MOVE

Private Sub Command1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then
    OldY = Y
    OldX = X
    MoveControl = True
End If

End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If MoveControl = True Then
    Command1.Top = Command1.Top - OldY + Y
    Command1.Left = Command1.Left - OldX + X
End If
End Sub

Private Sub Command1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MoveControl = False
End Sub


Private Sub Form_Load()
Dim TestReg As String
Label2.ForeColor = vbYellow


TestReg = GetSetting("ControlMove", "Settings", "Command1Top")

If TestReg = "" Then
    SaveSetting "ControlMove", "Settings", "Command1Top", Command1.Top
    SaveSetting "ControlMove", "Settings", "Command1Left", Command1.Left
    SaveSetting "ControlMove", "Settings", "Frame1Top", Frame1.Top
    SaveSetting "ControlMove", "Settings", "Frame1Left", Frame1.Left
    SaveSetting "ControlMove", "Settings", "Text1Top", Text1.Top
    SaveSetting "ControlMove", "Settings", "Text1Left", Text1.Left
Else
    Command1.Top = GetSetting("ControlMove", "Settings", "Command1Top")
    Command1.Left = GetSetting("ControlMove", "Settings", "Command1Left")
    Frame1.Top = GetSetting("ControlMove", "Settings", "Frame1Top")
    Frame1.Left = GetSetting("ControlMove", "Settings", "Frame1Left")
    Text1.Top = GetSetting("ControlMove", "Settings", "Text1Top")
    Text1.Left = GetSetting("ControlMove", "Settings", "Text1Left")
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
SaveSetting "ControlMove", "Settings", "Command1Top", Command1.Top
SaveSetting "ControlMove", "Settings", "Command1Left", Command1.Left
SaveSetting "ControlMove", "Settings", "Frame1Top", Frame1.Top
SaveSetting "ControlMove", "Settings", "Frame1Left", Frame1.Left
SaveSetting "ControlMove", "Settings", "Text1Top", Text1.Top
SaveSetting "ControlMove", "Settings", "Text1Left", Text1.Left
End Sub

'FRAME MOVE

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then
    OldY = Y
    OldX = X
    MoveControl = True
End If

End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If MoveControl = True Then
    Frame1.Top = Frame1.Top - OldY + Y
    Frame1.Left = Frame1.Left - OldX + X
End If
End Sub

Private Sub Frame1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MoveControl = False
End Sub


'TEXTBOX MOVE

Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then
    OldY = Y
    OldX = X
    MoveControl = True
End If

End Sub

Private Sub Text1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If MoveControl = True Then
    Text1.Top = Text1.Top - OldY + Y
    Text1.Left = Text1.Left - OldX + X
End If
End Sub

Private Sub Text1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MoveControl = False
End Sub

Private Sub Timer1_Timer()
If Label2.ForeColor = vbYellow Then
    Label2.ForeColor = vbRed
ElseIf Label2.ForeColor = vbRed Then
    Label2.ForeColor = vbYellow
End If
End Sub
