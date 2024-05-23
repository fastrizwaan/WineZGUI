import gi
import subprocess
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk

class RadioButtonWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="WineZGUI-0.99.13")
        self.set_default_size(300, 400)

        # Create a main vertical box
        main_vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        main_vbox.set_margin_start(10)
        main_vbox.set_margin_end(10)
        main_vbox.set_margin_top(10)
        main_vbox.set_margin_bottom(10)
        self.set_child(main_vbox)

        # Create a frame for the radio buttons
        frame = Gtk.Frame(label="Wine GUI using Zenity...")
        main_vbox.append(frame)

        # Create a vertical box to hold the radio buttons
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        vbox.set_margin_start(10)
        vbox.set_margin_end(10)
        vbox.set_margin_top(10)
        vbox.set_margin_bottom(10)
        frame.set_child(vbox)

        # List of labels for radio buttons
        labels = [
            "Open Exe...", "Launch...", "Script...", "Backup...", "Restore...",
            "Delete...", "Runner...", "Template...", "Settings...", "Kill all...",
            "More...", "Help...", "About...", "Quit..."
        ]

        # Initialize the first radio button
        self.check_buttons = []
        self.check1 = Gtk.CheckButton(label=labels[0])
        self.check1.connect("toggled", self.on_button_toggled)
        vbox.append(self.check1)
        self.check_buttons.append(self.check1)

        # Add remaining radio buttons
        for label in labels[1:]:
            check_button = Gtk.CheckButton(label=label)
            check_button.set_group(self.check1)
            check_button.connect("toggled", self.on_button_toggled)
            vbox.append(check_button)
            self.check_buttons.append(check_button)

        # Create a horizontal box for action buttons
        hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        hbox.set_halign(Gtk.Align.END)
        hbox.set_margin_top(10)
        main_vbox.append(hbox)

        # Create Cancel and OK buttons
        cancel_button = Gtk.Button(label="Cancel")
        cancel_button.connect("clicked", self.on_cancel_clicked)
        hbox.append(cancel_button)

        ok_button = Gtk.Button(label="OK")
        ok_button.connect("clicked", self.on_ok_clicked)
        hbox.append(ok_button)

    def on_button_toggled(self, button):
        if button.get_active():
            print(f"{button.get_label()} is selected")
            if button == self.check1:
                result = subprocess.run(["pwd"], capture_output=True, text=True)
                print(result.stdout)

    def on_cancel_clicked(self, button):
        print("Cancel button clicked")
        self.close()

    def on_ok_clicked(self, button):
        print("OK button clicked")
        active_button = next((b for b in self.check_buttons if b.get_active()), None)
        if active_button:
            print(f"Action for '{active_button.get_label()}'")
        self.close()

def main():
    # Create a new application
    app = Gtk.Application(application_id="com.example.GtkRadioButtons")

    # Connect the activate event to the function to build the UI
    app.connect("activate", on_activate)

    # Run the application
    app.run()

def on_activate(app):
    # Create a new window and set the application
    win = RadioButtonWindow()
    win.set_application(app)

    # Show the window
    win.present()

if __name__ == "__main__":
    main()
