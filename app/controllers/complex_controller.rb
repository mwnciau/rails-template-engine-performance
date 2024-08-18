class ComplexController < ActionController::Base
  def locals
    {
      colours:[
        { name: 'red',   current: false,  url: '#red', value: "#f00" },
        { name: 'green', current: false, url: '#green', value: "#0f0" },
        { name: 'blue',  current: false, url: '#blue', value: "#00f"  },
        { name: 'yellow',  current: false, url: '#yellow', value: "#ff0"  },
        { name: 'magenta',  current: false, url: '#magenta', value: "#f0f"  },
        { name: 'cyan',  current: false, url: '#cyan', value: "#0ff"  },
        { name: 'light red',   current: false,  url: '#light-red', value: "#f99" },
        { name: 'light green', current: false, url: '#light-green', value: "#9f9" },
        { name: 'light blue',  current: false, url: '#light-blue', value: "#99f"  },
        { name: 'light yellow',  current: true, url: '#light-yellow', value: "#ff9"  },
        { name: 'light magenta',  current: false, url: '#light-magenta', value: "#f9f"  },
        { name: 'light cyan',  current: false, url: '#light-cyan', value: "#9ff"  },
      ],
      header: 'Colours'
    }
  end

  def raw
    render "complex/raw", locals: locals
  end

  def erb
    render "complex/erb/index", layout: "complex-erb", locals: locals
  end

  def haml
    render "complex/haml/index", layout: "complex-haml", locals: locals
  end

  def rblade
    render "complex/rblade/index", locals: locals
  end

  def slim
    render "complex/slim/index", layout: "complex-slim", locals: locals
  end
end
