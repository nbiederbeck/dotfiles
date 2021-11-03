c.InteractiveShellApp.exec_lines = [
"""try:
    import numpy as np
    rng = np.random.default_rng()
except ImportError as e:
    print(e)""",
"""try:
    import matplotlib.pyplot as plt
except ImportError as e:
    print(e)""",
]
