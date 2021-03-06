public class Popover : Gtk.Grid {
    static Popover? instance;
    Stack stack = Stack.get_instance ();

    public static Popover get_instance () {
        if (instance == null) {
            instance = new Popover ();
        }
        return instance;
    }

    public Popover () {
        this.orientation = Gtk.Orientation.VERTICAL;
        this.margin = 5;
        this.row_spacing = 5;

        stack.get_stack ().notify["visible-child"].connect ( () => {
            this.remove_column (0);

            for (int i = 0; i <= TYPES.NAME[1,i].length; i++) {
                var button = new Gtk.Label ("");
                button.get_style_context ().add_class ("grid");
                button.get_style_context ().add_class ("pop");

                this.add (button);

                switch (stack.get_stack ().get_visible_child_name ()) {
                    case "electronegativity_view":
                        button.label = TYPES.NAME[i,1];
                        button.get_style_context ().add_class (TYPES.CSS_TAG[i,1]);
                        break;
                    default:
                        button.label = TYPES.NAME[i,0];
                        button.get_style_context ().add_class (TYPES.CSS_TAG[i,0]);
                        break;
                }

                //button.clicked.connect (() => {
                //});
            }
        });
    }
}
